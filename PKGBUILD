pkgbase=('i3-workspace-names')
pkgname=('i3-workspace-names')
_module='i3_workspace_names'
pkgver='0.3'
pkgrel=1
pkgdesc="Dynamically rename i3wm workspaces depending on windows"
url="https://gitlab.com/flib99/i3-workspace-names"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/i/i3-workspace-names/i3-workspace-names-${pkgver}.tar.gz")
md5sums=('5336774230539ea57870231b0d5bceae')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 0644 "$srcdir/$pkgbase-$pkgver/config.example.json" "$pkgdir/usr/lib/python3.6/site-packages/i3_workspace_names-$pkgver-py3.6.egg-info/config.example.json"
}
