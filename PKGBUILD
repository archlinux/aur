# Maintainer: Chris de Graaf <chrisadegraaf@gmail.com>
pkgname=pmcli
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A lightweight, customizable command-line client for the Google Play Music streaming service."
arch=('any')
url="https://github.com/christopher-dg/pmcli"
license=('MIT')
groups=()
keywords=('media', 'music')
depends=('python>=3.0')
makedepends=()
checkdepends=()
optdepends=()
provides=('pmcli')
conflicts=('pmcli')
replaces=()
backup=('~/.config/pmcli/config')
options=()
install=
changelog=
source=("https://github.com/christopher-dg/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=("17c1bfdb3b8f7f418ced4ea79c170cdb")
validpgpkeys=()

prepare()
{
pip3 install gmusicapi
mkdir -p ~/.{config/$pkgname,local/share/$pkgname/{src,script,playlists}}
}

package()
{
cd "$pkgname-$pkgver"
cp {pmcli,music_objects,util}.py ~/.local/share/$pkgname/src
cp get_dev_id.py ~/.local/share/pmcli/script
cp config mpv_input.conf ~/.config/$pkgname
chmod +x ~/.local/share/$pkgname/src/pmcli.py
sudo ln -s ~/.local/share/$pkgname/src/pmcli.py /usr/local/bin/pmcli
}
