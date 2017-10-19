# Maintainer: Luca Cristiano<lucamaker@gmail.com>
pkgname="openminemods"
pkgver=2.1.5
pkgrel=3
pkgdesc="An open source, GNU plus Linux compatible alternative to the Twitch Launcher"
arch=('any')
url="https://github.com/joonatoona/OpenMineMods/tree/v2.1.5"
license=('GNU Affero GPL')
groups=()
depends=('python3' 'python-beautifulsoup4' 'python-pyqt5' 'python-requests')
makedepends=('gendesk')
optdepends=('multimc5: the program just manages MultiMC instances for you. You will want this to actually run the 
packs.')
provides=("openminemods")
conflicts=("openminemods")
replaces=()
backup=()
options=()
install=
source=('https://github.com/OpenMineMods/OpenMineMods/releases/download/v2.1.5/Linux.zip')
noextract=()
md5sums=('SKIP')

build() {
    gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name="Open Mine Mods" --exec="OpenMineMods" --categories="Application;Game"
}

package() {
    cd "$srcdir"
    install -D "./$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 "./home/joonatoona/src/OpenMineMods/OpenMineMods/dist/OpenMineMods" "$pkgdir/usr/bin/OpenMineMods"
}
