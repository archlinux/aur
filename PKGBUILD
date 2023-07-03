# Maintainer: gilcu3 <gilcu3 at gmail dot com>

pkgname=bombsquad-server
pkgver=1.7.21
pkgrel=1
pkgdesc='An explosive arcade-style party game, local server'
arch=('x86_64' 'aarch64')
url='http://www.froemling.net/apps/bombsquad'
license=('unknown')
depends=('openal' 'libgl' 'sdl2' 'libvorbis' 'libogg' 'python')
source=('bombsquad-server.sh')
sha256sums=('82f833063fd6995823c8ba341879bac38d69a3470c1acbf4a7ffa7e3399c73f2')
sha256sums_x86_64=('56ce2120b41a3bef9f3c06f9d7295f02f1cc4617235fdece3ec20cf82a0fb9a7')
sha256sums_aarch64=('0e738fea533dd2cefbefd6124c397c2cd9fb032d120e48347adb118a994e1b90')
source_x86_64=("https://files.ballistica.net/bombsquad/builds/BombSquad_Server_Linux_x86_64_${pkgver}.tar.gz")
source_aarch64=("https://files.ballistica.net/bombsquad/builds/BombSquad_Server_Linux_Arm64_${pkgver}.tar.gz")


package() {
  cd "$srcdir"/BombSquad_Server_Linux_*_"$pkgver"

  install -Dm755 bombsquad_server "$pkgdir"/usr/share/bombsquad-server/bombsquad_server
  install -dm755 dist "$pkgdir"/usr/share/bombsquad-server/dist
  install -Dm755 config.yaml "$pkgdir"/usr/share/bombsquad-server/config.yaml
  cp -r dist "$pkgdir"/usr/share/bombsquad-server/

  find "${pkgdir}/usr/share/bombsquad-server/dist/ba_data" -type f -exec chmod 644 {} \;

  install -Dm 755 "$srcdir"/bombsquad-server.sh "$pkgdir"/usr/bin/$pkgname
}


