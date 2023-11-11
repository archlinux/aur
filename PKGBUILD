# Maintainer: waayne
pkgname=league-dashboard-git
pkgver=r1.d9e1982-1
pkgrel=2
pkgdesc="A browser dashboard for League of Legends where you can track gold differences of your current game."
arch=('x86_64')
conflicts=()
provides=("league-dashboard")
url="https://github.com/waaynee/LeagueDashboard"
license=('MIT')
depends=('git' 'python-flask' 'python-matplotlib' 'python-requests' 'python-waitress')
source=("git+https://github.com/waaynee/LeagueDashboard.git")
md5sums=('SKIP')

_gitname=LeagueDashboard
  
pkgver() {
    cd "$(_gitname)"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

package()
{
    cp -r "${srcdir}/LeagueDashboard" "/opt"
}
