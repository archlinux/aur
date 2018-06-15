pkgbase=('i3-workspace-names')
pkgname=('i3-workspace-names')
_module='i3_workspace_names'
pkgver='0.3.1'
pkgrel=2
pkgdesc="Dynamically rename i3wm workspaces depending on windows"
url="https://gitlab.com/flib99/i3-workspace-names"
depends=('python' 'i3-wm')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/i/i3-workspace-names/i3-workspace-names-${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 0644 "$srcdir/$pkgbase-$pkgver/config.example.json" "$pkgdir/usr/share/config.example.json"
}
