# Maintainer: dreieck

_pkgname=adhocspot-script
pkgname="${_pkgname}"
epoch=0
pkgver=20181219.2
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
  "66c99312050947355d984935b22a3bd40a69f0c6029d6f26dc1aa8d4d99163e7"
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
