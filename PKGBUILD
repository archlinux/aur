pkgname=linkwiz
_name=${pkgname#python-}
pkgdesc="A tool that lets users select their preferred browser for opening links."
pkgver=0.2.0
pkgrel=1
arch=('x86_64')
url="https://github.com/icealtria/linkwiz"
license=('GPL2')
depends=('python-pyxdg' 'python-tomli-w' 'tk' 'glib2')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
        "https://raw.githubusercontent.com/icealtria/linkwiz/main/Linkwiz.desktop"
        )
sha256sums=('c3add9e9c8427b3071ad46ec550d682f7ebe16117c41515d6a849d6e76bd4074'
            'b3f5e2b000f7d1e40eaa948ad3204b00a246155b9655190024eb35f784d3f98b')

package() {
    ls -al
    python -m installer --destdir="$pkgdir" ${pkgname}-${pkgver}-py3-none-any.whl
    install -Dm644 Linkwiz.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
