# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=newsd
pkgver=1.44
pkgrel=1
pkgdesc='Standalone local nntp server'
url='http://www.msweet.org/projects.php?Z4'
arch=('i686' 'x86_64')
license=('GPL2')
depends=(gcc-libs)
makedepends=(gcc-libs perl sed)
source=("http://www.msweet.org/files/project4/newsd-1.44-source.tar.gz"
	0001-Fix-some-errors.patch)
sha256sums=(e6d97cc347bc8f897cfa4c2f4aa80690fa7018efebc39555b1ab4aa19edee406
	    75d69ea858b55f60581e19ce18925b6a56da1f869aff8c0fcac9feb2c4924c58)



build()
{
    cd "${srcdir}/newsd-${pkgver}"
    ./configure --sbindir=/usr/bin
    patch -Np1 -i ../0001-Fix-some-errors.patch
    make
}

package()
{
    cd "${srcdir}/newsd-${pkgver}"
    make install DESTDIR="${pkgdir}"
}

