# Contributor: lanrat
# Contributor: Tblue <tilman (at) ax86 (dot) net>

pkgname='fortune-mod-bofh-excuses'
pkgver=1.2
pkgrel=2
pkgdesc='BOFH excuses fortune cookie files'
arch=('any')
url='http://www.cs.wisc.edu/~ballard/bofh/'
depends=('fortune-mod')
groups=('fortune-mods')
license=('Public domain')
source=("http://ftp.debian.org/debian/pool/main/f/fortunes-bofh-excuses/fortunes-bofh-excuses_${pkgver}.orig.tar.gz")

build()
{
    cd "${srcdir}/fortunes-bofh-excuses-${pkgver}"

    strfile ./bofh-excuses
}

package()
{
    cd "${srcdir}/fortunes-bofh-excuses-${pkgver}"
    
    install -D -m644 "${srcdir}/fortunes-bofh-excuses-${pkgver}/bofh-excuses" \
        "${pkgdir}/usr/share/fortune/bofh-excuses"
    install -D -m644 "${srcdir}/fortunes-bofh-excuses-${pkgver}/bofh-excuses.dat" \
        "${pkgdir}/usr/share/fortune/bofh-excuses.dat"
}

md5sums=('54742a9f82d49721e3f64280e916c604')
