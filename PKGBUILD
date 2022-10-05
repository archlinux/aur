#Maintainer: LevitatingBusinessMan (Rein Fernhout) <me@levitati.ng>

pkgname=git-bro
pkgver=r15.ade876b
arch=("x86_64")
pkgrel=1
pkgdesc="Monitor remote git repositories for changes and automate tasks."
license=("MIT")
depends=("ruby" "ruby-tomlrb" "ruby-libnotify")
url="https://github.com/LevitatingBusinessMan/git-bro"
source=("git+https://github.com/LevitatingBusinessMan/git-bro.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "${srcdir}/${pkgname}"
    install -Dvm 755 git-bro.rb $pkgdir/usr/bin/git-bro
    install -Dvm 644 systemd/user/git-bro.service $pkgdir/usr/lib/systemd/user/git-bro.service
    install -Dvm 644 systemd/user/git-bro.timer $pkgdir/usr/lib/systemd/user/git-bro.timer
    install -Dvm 644 systemd/system/git-bro.service $pkgdir/usr/lib/systemd/system/git-bro.service
    install -Dvm 644 systemd/system/git-bro.timer $pkgdir/usr/lib/systemd/system/git-bro.timer
}
