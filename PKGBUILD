# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=nxgameinfo-cli-bin
pkgver=0.7.1
pkgrel=2
pkgdesc='Tool to read information from Nintendo Switch game files - Command Line Interface'
arch=('any')
url='https://github.com/garoxas/NX_Game_Info'
license=('GPL-3.0-only')
depends=('mono')
provides=('nxgameinfo-cli')
conflicts=('nxgameinfo-cli')
source=("https://github.com/garoxas/NX_Game_Info/releases/download/v${pkgver}/NX.Game.Info_${pkgver}_cli.zip"
        "README_${pkgver}.md::https://raw.githubusercontent.com/garoxas/NX_Game_Info/v${pkgver}/README.md"
        'nxgameinfo_cli')
noextract=("NX.Game.Info_${pkgver}_cli.zip")
b2sums=('75071ce851f602623c38698975b1c68986907cf3b598ab05e3a2743aeee967eac737e70dcd319c528bb661f1125def852fdb32c3270ef753156f067e878890a1'
        'a6b380425e33929d88386a7017f179a76e3e7d4026ee4b1952dff9515d93cfd18f8dbfcdfa3c543bae25520696c83ae5e58ab21c4cd8d366ea47cdce192115df'
        '2bf9c868a4fccbf6aa4a196af172dc6266d24a463d8684c1a6c34e4de0d88e3f5e5aa4a0b7aee74419c4f264cafd470f032ef13375f0cad85eae10b0ba958090')

package() {
  install -d "$pkgdir/usr/lib/nxgameinfo_cli"
  unzip -d "$pkgdir/usr/lib/nxgameinfo_cli" "NX.Game.Info_${pkgver}_cli.zip"
  install -D -m644 README_${pkgver}.md "$pkgdir/usr/share/doc/nxgameinfo_cli/README.md"
  install -D -m755 nxgameinfo_cli "$pkgdir/usr/bin/nxgameinfo_cli"
}
