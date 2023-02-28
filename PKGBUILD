# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=criticality_score-bin
pkgver=2.0.2
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
sha256sums_i686=('3d3428fbe76b7a4cb15def5f5e5936c0ebc59e695d0e055caa03ded69222d33b')
sha256sums_x86_64=('ce64f89cfc353777afd3b86e9c4d00175b275370c87df49de381123f3c783956')
sha256sums_aarch64=('f0cd21e4c5f8d5940e4e24ecd8ae42b02e945e05aeebcce9e0f4312a265d4fcf')


package() {
  install -Dm755 "$srcdir"/{criticality_score,enumerate_github,scorer} -t "$pkgdir/usr/bin"
  install -Dm644 {README,README_criticality_score,README_enumerate_github,README_scorer}.md -t "$pkgdir/usr/share/doc/criticality_score"
}
