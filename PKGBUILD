# Maintainer: thorko contact@thorko.de
pkgname=psono-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="psono password manager cli"
arch=('x86_64')
url='https://github.com/meldron/psoco'
license=('GPL')
depends=('jq' 'xclip')
makedepends=('rust>=1.43')
source_x86_64=("https://github.com/meldron/psoco/archive/refs/tags/v0.1.0.tar.gz")
sha256sums_x86_64=('fdc8a3da8a8391e178aa3b7f9448ada8edfd8ea60e64b0e1f9e58d6afa40c996')


source=(
  "pwc"
)

sha256sums=(
  '2ddcfc6681d17beb77bcd160e6db9155b7bc9b83efef39decf0c6931cbacb430'
)

build() {
   cd psoco-0.1.0
   cargo build --release
}

package() {
  install -Dm0755 "${srcdir}/psoco-0.1.0/target/release/psoco" "${pkgdir}/usr/bin/psoco"
  install -Dm0755 "pwc" "${pkgdir}/usr/bin/psono-cli"
}
