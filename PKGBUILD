# Maintainer: gilded <knukles30@gmail.com>

pkgname=ani-cli-mx-git
_pkgbase=ani-cli-mx
pkgver=0.r801.gcbb9bf2
pkgrel=1
pkgdesc='Spanish-first independent fork of ani-cli'
arch=('any')
url='https://github.com/Gildedboy/ani-cli-mx'
license=('GPL-3.0-or-later')
depends=('bash' 'curl' 'fzf' 'grep' 'mpv' 'openssl' 'sed')
makedepends=('git')
optdepends=(
  'aria2: direct-file download support'
  'ffmpeg: m3u8 download fallback'
  'rofi: alternative interactive menu frontend'
  'vlc: alternative media player'
)
provides=('ani-cli-mx')
conflicts=('ani-cli-mx')
source=("${_pkgbase}::git+https://github.com/Gildedboy/ani-cli-mx.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  printf '0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgbase}"

  install -Dm755 ani-cli "${pkgdir}/usr/libexec/ani-cli-mx"
  install -Dm755 ani-cli-mx "${pkgdir}/usr/bin/ani-cli-mx"
  install -Dm644 ani-cli-mx.1 "${pkgdir}/usr/share/man/man1/ani-cli-mx.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
