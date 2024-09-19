# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mpg321"
pkgname="${_pkgname}-bin"
pkgver=0.3.2
_commit="a41a9397d10576d3aee39c2ed7628a78c285714d"
pkgrel=1
pkgdesc="A completely free drop-in replacement for mpg123"
arch=('x86_64' 'aarch64' 'armel' 'armhf' 'i686' 'mips64le' 'ppc64' 'ppc64le'
      'riscv64' 's390x')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-2.0-only')
depends=('alsa-lib' 'glibc' 'libao' 'libid3tag' 'libmad')
provides=("${_pkgname}" 'mpg123')
conflicts=("${_pkgname}" 'mpg123')
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,armel,armhf,i686,mips64le,ppc64,ppc64le,riscv64,s390x}".deb")
source=("COPYING-${pkgver}::https://sourceforge.net/p/${_pkgname}/code/ci/${_commit}/tree/COPYING?format=raw")
source_x86_64=("${_pkgsrc}-x86_64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-3.3_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-3.3_arm64.deb")
source_armel=("${_pkgsrc}-armel.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-3.3_armel.deb")
source_armhf=("${_pkgsrc}-armhf.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-3.3_armhf.deb")
source_i686=("${_pkgsrc}-i686.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-3.3_i386.deb")
source_mips64le=("${_pkgsrc}-mips64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-3.3_mips64el.deb")
source_ppc64=("${_pkgsrc}-ppc64.deb::http://ftp.ports.debian.org/debian-ports/pool-ppc64/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-3.3_ppc64.deb")
source_ppc64le=("${_pkgsrc}-ppc64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-3.3_ppc64el.deb")
source_riscv64=("${_pkgsrc}-riscv64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-3.3_riscv64.deb")
source_s390x=("${_pkgsrc}-s390x.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-3.3_s390x.deb")
b2sums=('990f7de07e8925e4c3b2ea78dc6164519a357435a2915987e3a6e95f05cab4a95eb95d11e38b481cf73dfcc58540058b278ddce7c15fa88d112dff90851bf501')
b2sums_x86_64=('8cbf1a3c0f35741c1c9b15c26e7e238473a39f514424fc1734513f3c63a93b0330e16dbe4dc5c4badd49e75142c1e8cbda75afdda969adbd3442294e151cda5a')
b2sums_aarch64=('00beec65de6920c677e040b150605640439f46194be58a58a27e1856b17af9b26f5af969ea741a8e8b7af31af2b0545226b83aef67ebe04f81ece4916324c7fc')
b2sums_armel=('8f9f5e27fe011f15983a8b7f2b28b80e1ec016c4bca32a2860bad94ac3f14a778f197aef93757962f83511f6adc87967008ab5fd077324bf683e999e2277eec2')
b2sums_armhf=('390269262f990dfe0c6f980f6e85489ca7a6e6ba72f860a9c5b7cda038d7df707c66af1de0cba41e7cbaaf656c061531f6cb11887ef89b31e4dcf6ecbb131670')
b2sums_i686=('1d6671699c05b8102e581468c2f01e04005b273361e96cf06731aad42b2d829d5d61315ae05b42f9ee0c3a571d429ac5ef57b87937a887f38426a6d2d06ee268')
b2sums_mips64le=('f2eda4867db9831d104a029ddb390d5568745e943eaac8be337a9f113a6fa83fe8755c504e7b27ffd8007fc575f78f14d88eb7da8711ea117b77ba1daf498041')
b2sums_ppc64=('472e9ed3d2386dddb1d608577649207519df4bd7a1e7d65eadd1453a8ae1aca68db23b68b7e4a88f34cc22a7a76275215047eff26d6f26a422bfee30bc0ba7d0')
b2sums_ppc64le=('af2b44b0a489d70559e3362d50d64473cad580a1e46dd432b047335fa2d8fb350eb1cc1b43b1ee832cf587ba312c257eef78650cd34450f1ba9c8858316fd38d')
b2sums_riscv64=('0996a2a462353ce7a32bafdb72f9782fad0e096e79fbb9dbaf145660168243473033b193ca512ff752bddfad5ed5fd8516195f864b07f3401ea1ce29e746e84e')
b2sums_s390x=('0996a2a462353ce7a32bafdb72f9782fad0e096e79fbb9dbaf145660168243473033b193ca512ff752bddfad5ed5fd8516195f864b07f3401ea1ce29e746e84e')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  cd "${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}"
  rm -f changelog.* ChangeLog.* copyright INSTALL NEWS.* *.Debian
}

package() {
  cd "${srcdir}"
  install -Dm644 "COPYING-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"

  cd "${_pkgsrc}-${CARCH}"
  find "usr/bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/share" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;

  cd "${pkgdir}/usr/bin"
  ln -s "mpg321" "mpg123"
}
