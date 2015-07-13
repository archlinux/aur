# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=fortune-mod-husse
pkgver=1.0.2
pkgrel=1
pkgdesc='A compilation of quotes from Husse (Linux Mint)'
url='http://www.packages.linuxmint.com/pool/main/f/fortunes-husse/'
arch=('any')
license=('GPL2')
depends=('fortune-mod')
groups=('fortune-mods')

source=('husse-funny'
	'husse-helping'
	'husse-moderating'
	'husse-self')
sha256sums=('1f973f63d0873b5e3b7e56be36121958b94510849e914562ed52e77288517ef3'
            '23be66fb1e951d099c077a2ffd3ad51f95d3fa2d3994a87630d1f4f6521889d7'
            '39d12b581e80888ce1e7d674d5d756be479e9132a1a1efe7a971373f7f59a430'
            'd88af0edb46fabe1ea486df610d46d5a2bf666420f7128d3a87a5e264910cd8b')

build() {
  for f in $(ls ${srcdir}); do
    strfile ${srcdir}/${f}
  done
}

package(){
  for f in $(ls ${srcdir}); do
    install -D -m644 ${srcdir}/${f} ${pkgdir}/usr/share/fortune/${f}
  done
}
