# Contributor: cdfk <cdfk1981-at-gmail.com>
# Contributor: alcasa.mz <alcasa.mz-at-gmail.com>

pkgname=brother-lpr-drivers-ac
pkgver=1.0.3
pkgrel=1
pkgdesc="This package provides all LPR drivers for models HL-4040CN HL-4040CDN HL-4050CDN HL-4070CDW MFC-9440CN MFC-9450CDN MFC-9840CDW DCP-9040CN DCP-9042CN DCP-9045CDN"
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  '7beb2abc3406c25f2b9408b3e1cb3b87') && depends=('brother-lpr-drivers-common' 'a2ps' 'lib32-glibc')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  '7369c4d71f98cbfc7d6a11b3d616042e') && depends=('brother-lpr-drivers-common' 'a2ps')

source=(http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-1-0ubuntu4_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-1-0ubuntu4_${_a}.deb || return 1
} 

package() {
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.tar.gz || return 1
}
