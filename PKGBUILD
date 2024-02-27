# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgbase=discreet-bin
pkgname=("discreet-gui-bin" "discreet-daemon-bin")
_pkgname0=${pkgname[0]/-bin/}
_pkgname1=${pkgname[1]/-bin/}
pkgdesc="Discreet Cryptocurrency Wallet. discreet.net - SCAM WARNING!"
pkgver=1.0.0
#_guiver="${pkgver}-3"
#_daemonver=0.0.28-2
pkgrel=1
arch=('x86_64')
#depends=('dotnet-sdk')
url="https://discreet.net"
#source=("https://deb.discreet.net/pool/main/${_pkgname0}_${_guiver}_amd64.deb"
#"https://deb.discreet.net/pool/main/${_pkgname1}_${_daemonver}_amd64.deb"
#)
#sha256sums=('0c8063f314e8a3a148efe25d44495d8694746375115995682d75e939da13b4d3'
#            '438d093d4a692204e85c35966b95ef0d8b5b96c35708630cb4cdbdab1d7f434c')
#noextract=("${_pkgname}-gui_${_guiver}_amd64.deb"
#"${_pkgname1}_${_daemonver}_amd64.deb")


build() {
  echo -e "
  \e[1;31mThe maintainer of this package was scammed out of thousands of dollars
  by the founder of the discreet project FRED MARKTOR!

  The maintainer of this package endured harassment
  at the hands of toxic community elements in the official discreetnetwork telegram channel.

  The maintainer of this package reported threats of sexual violence
  made against children by community member 'Discreet Priest'.

  The maintainer of this package
  was banned from https://t.me/discreetnetwork by FRED MARKTOR for reporting this

  The maintainer of this package was left with no ability to participate in the testnet
  nor any alternative for transferring presale tokens to mainnet coins.

  The maintainer of this package takes this opportunity to warn fellow arch users against this project.

  If this situation or assessment should change, the build shall be fixed and this warning rescinded.
  \e[0m"
  exit 0
}

package_discreet-gui-bin() {
	depends=("discreet-daemon-bin")
	provides=("discreet-gui")
	conflicts=("discreet-gui")
	#create directory trees
	cd ${pkgdir}
	ar -xf ${srcdir}/${_pkgname0}_${_guiver}_amd64.deb
	tar -xf data.tar.xz
	rm data.tar.xz
	rm control.tar.xz
	rm debian-binary
	rm ${pkgdir}/usr/bin/*
	ln -rTsf ${pkgdir}/usr/lib/${_pkgname0}/Discreet-GUI ${pkgdir}/usr/bin/${_pkgname0}
}
package_discreet-daemon-bin() {
	depends=("bzip2" "snappy" "lz4" "zlib" "zstd" "glibc")
	provides=("discreet-daemon")
	conflicts=("discreet-daemon")
	#create directory trees
	cd ${pkgdir}
	ar -xf ${srcdir}/${_pkgname1}_${_daemonver}_amd64.deb
	tar -xf data.tar.xz
	rm data.tar.xz
	rm control.tar.xz
	rm debian-binary
	rm ${pkgdir}/usr/bin/*
	ln -rTsf ${pkgdir}/usr/lib/discreet/Discreet ${pkgdir}/usr/bin/discreetd
	ln -rTsf ${pkgdir}/usr/lib/libdl.so.2 ${pkgdir}/usr/lib/discreet/libdl.so
}
