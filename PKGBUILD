# Maintainer: 4679kun <4679kun@outlook.com> 
pkgname=ftpsync 
pkgver=20131128
pkgrel=1 
pkgdesc="GNU FTPsync synchronizes a local dir with a remote URL." 
url="https://savannah.gnu.org/projects/ftpsync/" 
arch=('any') 
license=('GPLv3') 
depends=(
    'perl'
    'perl-file-listing'
    'perl-uri'
) 
source=("git+git://git.savannah.gnu.org/ftpsync.git")
md5sums=('SKIP') 

pkgver() {
    cd "${srcdir}/${pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() { 
    install -Dm755 "${srcdir}/ftpsync/src/ftpsync" "${pkgdir}/usr/bin/ftpsync"
    install -Dm755 "${srcdir}/ftpsync/src/ftpsync-ssl" "${pkgdir}/usr/bin/ftpsync-ssl"
    install -Dm644 "${srcdir}/ftpsync/src/ftpsync.1" "${pkgdir}/usr/share/man/man1/ftpsync.1"
}
