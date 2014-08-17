# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DonOregano <lars@foldspace.nu>

pkgname=subgit
pkgver=2.0.2
pkgrel=3
pkgdesc="Provides smooth Subversion to Git migration and synchronisation"
arch=('any')
url="http://subgit.com"
license=('custom')
depends=('bash' 'java-runtime>=5')
optdepends=('subversion' 'git')
source=("$url/download/$pkgname-$pkgver.zip")
sha256sums=('6266c05aa212701c7bb605d44daa94b805aedbfa6ebd222b2c74d8dc232c66f6')

package() {
  cd $pkgname-$pkgver

  # folders
  install -d "$pkgdir"/usr/{bin,share/{{licenses,doc}/subgit,subgit/lib}}
  # script
  install -Dm755 bin/subgit "$pkgdir"/usr/share/subgit/bin/subgit
  # libs
  install -Dm644 lib/*.jar "$pkgdir"/usr/share/subgit/lib
  # doc
  install -Dm644 {CHANGES,KNOWN_ISSUES,README}.txt "$pkgdir"/usr/share/doc/subgit
  # licenses
  install -Dm644 LICENSE.txt lib/licenses/*.txt "$pkgdir"/usr/share/licenses/subgit
  # symlink to make command available
  ln -s /usr/share/subgit/bin/subgit "$pkgdir"/usr/bin/subgit
}
