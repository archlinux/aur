# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=pkgman
pkgver=r188
pkgrel=1
pkgdesc="A script providing centralized local package and PKGBUILD management"
arch=('any')
url="http://sourceforge.net/apps/mediawiki/pkgman/index.php?title=Main_Page"
license=('GPL')
depends=('abs' 'curl' 'findutils' 'gawk' 'grep' 'pacman' 'sed')
optdepends=('namcap: check built packages' \
            'desktop-file-utils: validate desktop entry files'
            'tree: formatted directory listing')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('31f45848c515c13b2291d3a8c41022f7')
sha256sums=('9a01b9026b7b69ff35128fb3df2f66b4777ce9890a5e8229efef566877848864')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -v -D -m 0755 pkgman.bash ${pkgdir}/usr/bin/pkgman
  install -v -D -m 0644 pkgman ${pkgdir}/etc/bash_completion.d/pkgman

  install -v -D -m 0644 pkgman.8 ${pkgdir}/usr/share/man/man8/pkgman.8
  install -v -D -m 0644 AUR.conf ${pkgdir}/usr/share/pkgman/AUR.conf
  install -v -m 0644 categories.list ${pkgdir}/usr/share/pkgman/  
  install -v -m 0644 pkgman.conf ${pkgdir}/usr/share/pkgman/
  install -v -m 0644 prompt.bash ${pkgdir}/usr/share/pkgman/
  # libs
  install -v -m 0755 -d ${pkgdir}/usr/lib/pkgman
  install -v -m 0755 json.sh ${pkgdir}/usr/lib/pkgman/
  install -v -m 0644 lib_cleanup.bash ${pkgdir}/usr/lib/pkgman/
  install -v -m 0644 lib_format.bash ${pkgdir}/usr/lib/pkgman/
  install -v -m 0644 lib_init.bash ${pkgdir}/usr/lib/pkgman/
  install -v -m 0644 lib_info.bash ${pkgdir}/usr/lib/pkgman/
  install -v -m 0644 lib_list.bash ${pkgdir}/usr/lib/pkgman/
  install -v -m 0644 lib_net.bash ${pkgdir}/usr/lib/pkgman/
  install -v -m 0644 lib_pkg.bash ${pkgdir}/usr/lib/pkgman/
  install -v -m 0644 lib_start.bash ${pkgdir}/usr/lib/pkgman/
  # proto files
  install -v -D -m 0644 proto.desktop ${pkgdir}/usr/share/pacman/proto.desktop
  install -v -m 0644 PKGBUILD-lib32.proto ${pkgdir}/usr/share/pacman/
  install -v -m 0644 PKGBUILD-meta.proto ${pkgdir}/usr/share/pacman/
}

# vim:set ts=2 sw=2 et:
