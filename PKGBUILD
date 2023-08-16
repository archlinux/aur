# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=paccache-hook
pkgver=1.1.1
pkgrel=2
pkgdesc="A configurable hook to cleanup the pacman package cache using paccache"
arch=('any')
license=('BSD')
depends=('pacman-contrib')
conflicts=('pacman-cleanup-hook')
source=("$pkgname.conf"
        "$pkgname.sh"
        "$pkgname.hook"
        "LICENSE")
b2sums=('c1d92590b4426c52a22152ca4901126ba2622e78ec14eba9be2a9e41f909ddceee01beb8fc4e95a12cd8ed78cb31a12118b0c16ea1498718397f04862c613408'
        'b58919eff78e6b63ce0cd724a49c4d39fb2ab37920e14173560485f0d434a6a96b065f9342fa162e8f7a346bd22522fc7b80f7991d2f4ab9df3815f813160aa7'
        'ebc6394bd960fd6f2bb26593be20461adf8e251124787e98664343426c9cdec04bfff7677aba0e78d6f43b885f40e415243b683473eaecd082e5f3ef83cc53ab'
        '9ec9da9d10bb6bc940a83bb087d04154e41920fe78723d3e746e632a04c50c40bb5bbc807b955f8b81b78a225297c099f7b4077881f8c506b13285a41b65a552')
backup=("etc/$pkgname.conf")

package() {
  install -D -m644 "${srcdir}/$pkgname.hook" "${pkgdir}/usr/share/libalpm/hooks/$pkgname.hook"
  install -D -m755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/share/libalpm/scripts/$pkgname.sh"
  install -D -m644 "${srcdir}/$pkgname.conf" "${pkgdir}/etc/$pkgname.conf"
  install -D -m644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
