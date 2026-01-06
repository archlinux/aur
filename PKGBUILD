pkgname=user-analysis-git
pkgver=r3.72045ce
pkgrel=1
pkgdesc="A tool to keep linux users on the live system in parity with systemd sysuser.d defaults"
url="https://github.com/graysky2/user-analysis"
arch=('any')
license=('unknown')
source=("user-analysis::git+https://github.com/graysky2/user-analysis.git")
md5sums=('SKIP')

pkgver(){
    cd user-analysis
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "$srcdir/user-analysis/user-analysis.sh" "$pkgdir/usr/bin/user-analysis"
}
