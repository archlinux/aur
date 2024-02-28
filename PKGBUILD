pkgname=linkwiz
_name=${pkgname#python-}
pkgdesc="A tool that lets users select their preferred browser for opening links."
pkgver=0.1.2
pkgrel=1
arch=('x86_64')
url="https://github.com/icealtria/linkwiz"
license=('GPL2')
depends=('python-pyxdg' 'python-tomlkit' 'tk' 'glib2')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
        "https://raw.githubusercontent.com/icealtria/linkwiz/main/Linkwiz.desktop"
        )
sha256sums=('75ae205ba79a6a56fffe669bd51f20f31422da0b6d9eb959dfb3e663efba4bad'
            'b3f5e2b000f7d1e40eaa948ad3204b00a246155b9655190024eb35f784d3f98b')

package() {
    ls -al
    python -m installer --destdir="$pkgdir" ${pkgname}-${pkgver}-py3-none-any.whl
    install -Dm644 Linkwiz.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
