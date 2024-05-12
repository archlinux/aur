# Maintainer: Christopher Michael Mescher $(echo \<pascha-mescher+faith\>|sed s/\+/./g\;s/\-/@/)

pkgname=pascha-cli-bin
pkgver=2.1
pkgrel=1

pkgdesc="A simple CLI program to calculate and display the date of Pascha (Easter)"
arch=('any')
url="https://gitlab.com/cmmescher/pascha-cli.git"
license=('GPL3')
depends=()
makedepends=()
provides=("${pkgname%-cli-bin}")
conflicts=("${pkgname%-cli-bin}")
source=("https://github.com/cmmescher/pascha-cli/releases/download/v2.1/pascha-v2-1.gz"
  "https://gitlab.com/cmmescher/pascha-cli/-/archive/v2.1/pascha-cli-v2.1.tar.gz")
md5sums=('04ad21069a3ac56e8afecf03731a0eec'
         '8e8652bbf93ffbb092ea5c215514d1f5')
sha256sums=('0a5e7b4d1892d94353d28dcb9eb8c4b1996a3c3b376611b897c38fb5898015c7'
            '26e5da34db28ee7701b70a526e7394b425fa98a9e2705724637d696a2dfd634d')

package() {
    install -Dm0755 "$srcdir/pascha-v2-1" "$pkgdir/usr/bin/pascha"
    install -Dm0644 -t "$pkgdir/usr/share/man/man1" "$srcdir/pascha-cli-v2.1/pascha.1.gz"
}
