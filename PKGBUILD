# Maintainer: robertfoster

pkgname=shisper-git
pkgver=0.2.6.r0.g9cd1532
pkgrel=1
pkgdesc="A quick & dirty script to generate subtitles and transcriptions for your multimedia files using ggerganov/whisper.cpp"
arch=(any)
url="https://github.com/M0Rf30/shisper"
license=('GPL3')
depends=(
  'ffmpeg'
  'mpv'
  'whisper.cpp'
)
makedepends=('git')
conflicts=("${pkgname%%-git}")
provides=("${pkgname%%-git}")
backup=('etc/shisper/config.ini')
source=("${pkgname%%-git}::git+${url}")

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  install -Dm755 "${pkgname%%-git}" \
    -t "${pkgdir}/usr/bin/"
}

sha256sums=('SKIP')
