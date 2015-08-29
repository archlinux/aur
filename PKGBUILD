# Maintainer: Brent Saner <brent (dot) saner (at) gmail (dot) com>

pkgname=storcli
pkgver=1.15.12
pkgrel=1
pkgdesc="A successor to lsiutil"
arch=('i686' 'x86_64')
url="https://www.thomas-krenn.com/en/wiki/StorCLI"
license=('unknown')
if [[ "${CARCH}" == 'x86_64' ]];
then
  _arch='amd64'
  _bits='64'
elif [[ "${CARCH}" == 'i686' ]];
then
  _arch='i386'
  _bits=''
fi
source=("http://archive.thomas-krenn.com/packages/pool/optional/s/storcli/storcli_${pkgver}_${_arch}.deb")
if [[ "${_arch}" == "amd64" ]];
then
  md5sums=('a899d70f8f8d106db70c7188a9edeae7')
elif [[ "${_arch}" == "i386" ]];
then
  md5sums=('031e910733b7861749d27968a7d452de')
fi
provides=('storcli')
conflicts=('megaraid-cli')

package() {
	cd ${srcdir}
	ar x ${pkgname}_${pkgver}_${_arch}.deb
	tar -zxf data.tar.gz

	install -D -m755 "${srcdir}/usr/sbin/storcli${_bits}" "${pkgdir}/usr/bin/storcli"

}

