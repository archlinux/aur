# Maintainer: j-g00da <jslazak@jslazak.com>

pkgname=term-everything-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="Run every GUI app in the terminal!"
arch=('x86_64' 'aarch64')
url="https://github.com/mmulet/term.everything"
license=('AGPL')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")

_filename_x86_64="term.everything.mmulet.com-dont_forget_to_chmod_+x_this_file_x86_64"
source_x86_64=("$url/releases/download/$pkgver/$_filename_x86_64" "https://raw.githubusercontent.com/mmulet/term.everything/refs/tags/$pkgver/LICENSE.txt")
sha256sums_x86_64=("4b057cb65dc70ff623bd8b88ca03dcf5710025420871713d0088b68564d40c18" "SKIP")

_filename_aarch64="ARM_ARM_for_aarch_64_systems_term.everything.mmulet.com-dont_forget_to_chmod_+x_this_file_ARM"
source_aarch64=("$url/releases/download/$pkgver/$_filename_aarch64" "https://raw.githubusercontent.com/mmulet/term.everything/refs/tags/$pkgver/LICENSE.txt")
sha256sums_aarch64=("ac03b7ff01bb2ffdedbce13a4894b73d126c90923bd1025c0247b7d13f660a59" "SKIP")

package() {
  if [ -f $_filename_x86_64 ]; then
    mv $_filename_x86_64 "${pkgname%-bin}"
  elif [ -f $_filename_aarch64 ]; then
    mv $_filename_aarch64 "${pkgname%-bin}"
  fi
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
