# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
pkgbase=heavything
pkgname=('rwasa' 'webslap' 'hnwatch' 'dhtool' 'sshtalk') #toplip
pkgver=1.13
pkgrel=1
pkgdesc='A General purpose x64 Asm library for 2ton products'
arch=('x86_64')
makedepends=('fasm')
url='https://2ton.com.au/HeavyThing'
license=('GPL3')
source=("https://2ton.com.au/HeavyThing-$pkgver.tar.gz")
sha256sums=('95e46bcaef8a90257ae2d81330700d72da0bb633c4ff38fbfeaded30c4f106c6')

build () {
  cd "HeavyThing-$pkgver"
  for i in rwasa webslap hnwatch dhtool sshtalk; do #toplip
    (cd "$i"; fasm -m 262144 "$i.asm" && ld -o "$i" "$i.o")
  done
}

package_rwasa () {
  pkgdesc='a full featured web server that eclipses nginx'
  url='https://2ton.com.au/rwasa/'
  cd "HeavyThing-$pkgver/rwasa"
  install -Dm755 rwasa "$pkgdir/usr/bin/rwasa"
}

package_webslap () {
  pkgdesc='a website quality assurance reporting tool'
  url='https://2ton.com.au/webslap/'
  cd "HeavyThing-$pkgver/webslap"
  install -Dm755 webslap "$pkgdir/usr/bin/webslap"
}

package_hnwatch () {
  pkgdesc='a HackerNews API realtime terminal watch/reader'
  url='https://2ton.com.au/hnwatch/'
  cd "HeavyThing-$pkgver/hnwatch"
  install -Dm755 hnwatch "$pkgdir/usr/bin/hnwatch"
}

package_dhtool () {
  pkgdesc='a Diffie-Hellman parameter generator/verifier/converter'
  url='https://2ton.com.au/dhtool/'
  cd "HeavyThing-$pkgver/dhtool"
  install -Dm755 dhtool "$pkgdir/usr/bin/dhtool"
}

package_sshtalk () {
  pkgdesc='an ephemeral multi-person SSH chat'
  url='https://2ton.com.au/sshtalk/'
  cd "HeavyThing-$pkgver/sshtalk"
  install -Dm755 sshtalk "$pkgdir/usr/bin/sshtalk"
}

#package_toplip () {
#  pkgdesc='a command line very strong encryption utility'
#  url='https://2ton.com.au/toplip/'
#  cd "HeavyThing-$pkgver/toplip"
#  install -Dm755 toplip "$pkgdir/usr/bin/toplip"
#}

# vim:set ts=2 sw=2 et:
