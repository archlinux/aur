# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=criticality_score-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Gives criticality score for an open source project"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/ossf/criticality_score"
license=('apache')
provides=("criticality_score=$pkgver")
conflicts=('criticality_score')
source_i686=("https://github.com/ossf/criticality_score/releases/download/v${pkgver}/criticality_score_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/ossf/criticality_score/releases/download/v${pkgver}/criticality_score_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/ossf/criticality_score/releases/download/v${pkgver}/criticality_score_${pkgver}_linux_arm64.tar.gz")
sha256sums_i686=('a807ddb37b547dbb2ae3126b4f85ff43143ff97199679072ebda48ac4b8ec991')
sha256sums_x86_64=('334271d6b2214966a151ff1f4ab95433161f6e7d2e705a5d566fd7446fd3dedb')
sha256sums_aarch64=('d0371b256ae85dda72d2677a6413e2004f29c7a6ecffc235b815e64087ee1f1a')


package() {
  install -Dm755 "$srcdir"/{criticality_score,enumerate_github,scorer} -t "$pkgdir/usr/bin"
  install -Dm644 {README,README_criticality_score,README_enumerate_github,README_scorer}.md -t "$pkgdir/usr/share/doc/criticality_score"
}
