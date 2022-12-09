# Maintainer: gilcu3 <gilcu3 at gmail dot com>

pkgname=bombsquad-server
pkgver=1.7.15
pkgrel=1
pkgdesc='An explosive arcade-style party game, local server'
arch=('x86_64' 'aarch64')
url='http://www.froemling.net/apps/bombsquad'
license=('unknown')
depends=('openal' 'libgl' 'sdl2' 'libvorbis' 'libogg' 'python')
source=('bombsquad-server.sh')
sha256sums=('82f833063fd6995823c8ba341879bac38d69a3470c1acbf4a7ffa7e3399c73f2')
sha256sums_x86_64=('1c1e9e9398e77d81cafcb279ee2fe3bb599081456047201adacc8cafd9a0db8e')
sha256sums_aarch64=('7a5da3e3715c9b5482a2e0ce46e6a3d5d1c8c96957ba1821322f48840c7c5c6e')
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


