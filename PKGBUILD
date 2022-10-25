# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=sharps-talking-clock
pkgver=1
pkgrel=1
pkgdesc="CLI version of the old Sharps talking clock"
arch=('any')
url="https://billy.wolfe.casa"
license=('WTFPL')
depends=('bash' 'sox')
source=("${url}/downloads/sharps-talking-clock.tar.xz")
sha512sums=('f5e366fb38798cdbd67099ade455d870c1703993ea1d8144ef47eb9c377c04ffbc52065d72203fe5325f60528c8378a3104ae8be4c515231777f96192993e44d')

package()
 {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "sharps-talking-clock.sh" "$pkgdir/usr/bin/sharps-talking-clock"
 install -d "$pkgdir/usr/share/sounds/sharps-talking-clock"
  install -Dm644 "README.md" "$pkgdir/usr/share/sharps-talking-clock/README.md"
  for i in 00 {1..20} 30 40 50 alarm am announcement hour{1,2} its o pm ; do
    install -m644 "${srcdir}/${pkgname}/sounds/${i}.ogg" "${pkgdir}/usr/share/sounds/sharps-talking-clock/"
done
  }

# vim:set ts=2 sw=2 et:
