# Maintainer: gilcu3
# Contributor: gilcu3
pkgname=bombsquad-server
pkgver=1.7.39
pkgrel=1
pkgdesc='An explosive arcade-style party game, local server'
arch=('x86_64' 'aarch64')
url='http://www.froemling.net/apps/bombsquad'
license=('unknown')
depends=('openal' 'libgl' 'sdl2' 'libvorbis' 'libogg' 'python')
source=('bombsquad-server.sh')
sha256sums=('82f833063fd6995823c8ba341879bac38d69a3470c1acbf4a7ffa7e3399c73f2')
sha256sums_x86_64=('71659091c384a3ad3e0ca444a2969920c725ea4741bd427b6ae9498fd0eb9d9b')
sha256sums_aarch64=('bc7a2761a63dc4940261d59265676ab9351158350aebe8d49e77bc9b2929183d')
source_x86_64=("https://files.ballistica.net/bombsquad/builds/BombSquad_Server_Linux_x86_64_${pkgver}.tar.gz")
source_aarch64=("https://files.ballistica.net/bombsquad/builds/BombSquad_Server_Linux_Arm64_${pkgver}.tar.gz")


package() {
  cd "$srcdir"/BombSquad_Server_Linux_*_"$pkgver"

  install -Dm755 bombsquad_server "$pkgdir"/usr/share/bombsquad-server/bombsquad_server
  install -dm755 dist "$pkgdir"/usr/share/bombsquad-server/dist
  install -Dm755 config.toml "$pkgdir"/usr/share/bombsquad-server/config.toml
  cp -r dist "$pkgdir"/usr/share/bombsquad-server/

  find "${pkgdir}/usr/share/bombsquad-server/dist/ba_data" -type f -exec chmod 644 {} \;

  install -Dm 755 "$srcdir"/bombsquad-server.sh "$pkgdir"/usr/bin/$pkgname
}


