# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=criticality_score-bin
pkgver=2.0.0
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
sha256sums_i686=('34b67c3afbfa88449b0358b39c358033ae88d8b6777af4326711da61da2659d4')
sha256sums_x86_64=('618480487e9fee8c056f9264dea8d82cb16514d4ee490f1ccbcafd63e26844a5')
sha256sums_aarch64=('1d5cdbb49d65fc87739f72dbdb875d34b92c09de4cfd9f8fe5489d7ecad79e80')


package() {
  install -Dm755 "$srcdir"/{criticality_score,enumerate_github,scorer} -t "$pkgdir/usr/bin"
  install -Dm644 {README,README_criticality_score,README_enumerate_github,README_scorer}.md -t "$pkgdir/usr/share/doc/criticality_score"
}
