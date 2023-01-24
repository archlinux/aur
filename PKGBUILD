# Maintainer: SpamixOfficial <spamixofficial@gmail.com>
# Contributor:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=hashzam-git
pkgver=r8.930d9f6
pkgrel=1
pkgdesc="A simple command line tool written in python that calculate and compare hashes!"
arch=(any)
url="https://github.com/SpamixOfficial/hashzam-git.git"
license=('GPL3')
depends=('python' 'python-colorama')
makedepends=('git')
provides=(hashzam)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
	install -Dm755 hashzam.py "${pkgdir}/usr/bin/hashzam"
	install -Dm444 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm444 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
