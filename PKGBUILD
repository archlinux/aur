# Maintainer: dreieck

_pkgname=adhocspot-script
pkgname="${_pkgname}"
epoch=0
pkgver=20181219.1
pkgrel=1
pkgdesc="Bash script to easily configure your interface to share your internet connection and configure a DHCP and DNS and TFTP boot server to listen on it. IP, DHCP, DNS can be configured, and for WiFi interfaces also wireless mode and encryption."
arch=('any')
license=('custom: Public Domain')

groups=(
       )

depends=(
  "bash"
  "dnsmasq"
  "iptables"
  "net-tools"
  "wireless_tools"
  "wpa_supplicant"
)

makedepends=()

optdepends=()

provides=()

conflicts=()

replaces=()

install='adhocspot-script.install'


source=(
  "adhocspot.sh"
  "copying.txt"
  "adhocspot-script.install"
)

sha256sums=(
  "b2247253c0e3866f4b8631eecb81bb773f3abbaa84ca317ab23c2b6eb725494f"
  "c3cbff25307e905545788f5c74cc137d79706c60549092f2a37919b93cf55ee3"
  "f05052583b9d7ba8215897bc621fea38d18fea20e1040fcbda4fd2ab76fc8867"
)

pkgver() {
  "${srcdir}/adhocspot.sh" --version
}

package() {
  _licdirbase="/usr/share/licenses/${pkgname}"
  _licdir="${pkgdir}/${_licdirbase}"
  _execdirbase='/usr/bin'
  _execdir="${pkgdir}/${_execdirbase}"
  _rundirbase="/run/adhocspot"
  _rundir="${pkgdir}/${_rundirbase}"
  
  install -v -D -m755 "${srcdir}/adhocspot.sh" "${_execdir}/adhocspot.sh"
  install -v -D -m644 "${srcdir}/copying.txt" "${_licdir}/copying.txt"
  install -v -d -m755 "${_rundir}"
}
