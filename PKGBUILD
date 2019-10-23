# Maintainer: Jguer <joaogg3 at gmail dot com>
pkgname=yay-bin
pkgver=9.4.0
pkgrel=2
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled."
# arch=('x86_64' 'aarch64' 'armv7h')
arch=('x86_64')
url="https://github.com/Jguer/yay"
license=('GPL')
depends=(
  'sudo'
  'git'
)
provides=('yay')
conflicts=('yay')

source_x86_64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_x86_64.tar.gz")
# source_aarch64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_aarch64.tar.gz")
# source_armv7h=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_armv7h.tar.gz")

sha1sums_x86_64=('f7a698f4e3b261894ae70eed743339269de4cafb')
# sha1sums_aarch64=('b5329503a18b1b225feb84878a58ae612b09f165')
# sha1sums_armv7h=('a297551acf786555ea51a3cc68ca5235364ab499')

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${CARCH}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/yay.8" "${pkgdir}/usr/share/man/man8/yay.8"

  # Shell autocompletion script
  install -Dm644 "${_output}/bash" "${pkgdir}/usr/share/bash-completion/completions/yay"
  install -Dm644 "${_output}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_yay"
  install -Dm644 "${_output}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"
}
