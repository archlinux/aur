# Maintainer: Owen D'Aprile <owendaprile at gmail dot com>

pkgname='genius-spicetify-git'
_reponame='genius-spicetify'
pkgver=r6.4c033d1
pkgrel=1
pkgdesc='Spicetify app that fetches lyrics from Genius'
arch=('any')
url='https://github.com/khanhas/genius-spicetify'
license=('unknown')
depends=('spicetify-cli'
         'spotify')
makedepends=('git')
source=('git+https://github.com/khanhas/genius-spicetify.git')
sha256sums=('SKIP')

pkgver() {
    cd $_reponame
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
    cd $srcdir/$_reponame
    find . -type d -name ".git" -prune -o -type f -not -name "README.md" -exec install -vDm644 {} $pkgdir/usr/share/spicetify-cli/CustomApps/genius/{} \;
}
