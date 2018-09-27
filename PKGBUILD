# Maintainer: Bian Jiaping <ssbianjp@gmail.com>
# Contributor: Randy Ramos <rramos1295 \at\ gmail \dot\ com>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: DonOregano <lars@foldspace.nu>

pkgname=subgit
pkgver=3.3.4
pkgrel=1
pkgdesc="Provides smooth Subversion to Git migration and bidirectional synchronization"
arch=('any')
url="https://subgit.com"
license=('custom')
depends=('java-runtime-headless>=8')
optdepends=('subversion' 'git')
source=("https://subgit.com/files/subgit-${pkgver}.zip")
md5sums=('2e71013a4b588b0afb6fb232f215ef04')

package() {
  cd subgit-$pkgver

  # folders
  install -d "$pkgdir"/usr/{bin,share/{{licenses,doc}/subgit,subgit/lib}}
  # script
  install -Dm755 bin/subgit "$pkgdir"/usr/share/subgit/bin/subgit
  # libs
  install -Dm644 lib/*.jar "$pkgdir"/usr/share/subgit/lib
  # doc
  install -Dm644 {CHANGES,README}.txt "$pkgdir"/usr/share/doc/subgit
  # licenses
  install -Dm644 LICENSE.txt lib/licenses/*.txt "$pkgdir"/usr/share/licenses/subgit
  # symlink to make command available
  ln -s /usr/share/subgit/bin/subgit "$pkgdir"/usr/bin/subgit
}
