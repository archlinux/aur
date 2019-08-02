# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-sudospawner
pkgdesc="Spawn JupyterHub single-user servers with sudo"
pkgver=0.5.2
pkgrel=1
url="https://github.com/jupyterhub/sudospawner"
arch=('any')
depends=('jupyterhub' 'jupyter')
license=('BSD')
source=("https://github.com/jupyterhub/sudospawner/archive/${pkgver}.tar.gz")
sha256sums=("bee2f1fff8795918408a9cf9eef5988b5eff48c2dac38d37adba2cbdd8a578a5")

build() {
    cd "sudospawner-${pkgver}"
    python setup.py build
}

package() {
    cd "sudospawner-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
