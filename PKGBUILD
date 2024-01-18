# Maintainer: gilcu3 <gilcu3 at gmail dot com>

pkgname=bombsquad-server
pkgver=1.7.33
pkgrel=1
pkgdesc='An explosive arcade-style party game, local server'
arch=('x86_64' 'aarch64')
url='http://www.froemling.net/apps/bombsquad'
license=('unknown')
depends=('openal' 'libgl' 'sdl2' 'libvorbis' 'libogg' 'python')
source=('bombsquad-server.sh')
sha256sums=('82f833063fd6995823c8ba341879bac38d69a3470c1acbf4a7ffa7e3399c73f2')
sha256sums_x86_64=('85380440196ce5b684403b47d084944c5afa2d50e70dbd15e971dd4c33a60245')
sha256sums_aarch64=('2298b86fa6adf4976c55d5d102c3d2470510b5d44669d79df5c12d6c39b771e3')
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


