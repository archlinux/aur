pkgname=linkwiz
_name=${pkgname#python-}
pkgdesc="A tool that lets users select their preferred browser for opening links."
pkgver=0.2.7
pkgrel=1
arch=('any')
url="https://github.com/icealtria/linkwiz"
license=('GPL2')
depends=('python-pyxdg' 'python-tomli-w' 'tk')
makedepends=(python-installer)
optdepends=(python-unalix-rev)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
        "https://raw.githubusercontent.com/icealtria/linkwiz/main/Linkwiz.desktop"
        )
sha256sums=('96662d98548b24d733a9cda65814f49cd18a816e862926b632b6aa0124bbfe89'
            'b3f5e2b000f7d1e40eaa948ad3204b00a246155b9655190024eb35f784d3f98b')

package() {
    python -m installer --destdir="$pkgdir" ${pkgname}-${pkgver}-py3-none-any.whl
    install -Dm644 Linkwiz.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
