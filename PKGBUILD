# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-idle-culler
pkgdesc="JupyterHub service to cull and shut down idle users and notebook servers"
pkgver=1.1
pkgrel=1
url="https://github.com/jupyterhub/jupyterhub-idle-culler"
arch=('any')
depends=('python-dateutil' 'python-tornado')
makedepends=('git' 'python-setuptools')
license=('BSD')
source=(
  "git+https://github.com/jupyterhub/$pkgname.git#tag=v$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "COPYING.md" "$pkgdir/usr/share/licenses/$pkgname/COPYING.md"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
