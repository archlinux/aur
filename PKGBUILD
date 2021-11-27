# Maintainer: Paul Bastian <paul.bastian@posteo.de>
pkgname=nextcloud-maintenance
pkgver=0.1.0
pkgrel=1
pkgdesc="Scripts and services to support nextcloud maintenance"
arch=('any')
url="https://github.com/paulbastian/aur/tree/master/nextcloud-maintenance"
license=('APACHE')
source=("https://raw.githubusercontent.com/paulbastian/aur/master/nextcloud-maintenance/nextcloud-backup.sh"
        "https://raw.githubusercontent.com/paulbastian/aur/master/nextcloud-maintenance/nextcloud-backup.service"
        "https://raw.githubusercontent.com/paulbastian/aur/master/nextcloud-maintenance/nextcloud-backup.timer")
sha256sums=('7a63bb54ab1115906e3f4313b44d24d8de012ce21999949ed797d4f91e00bc9a'
            '3129b829825c8870176360e29a20c3edcbf0fd7a9851c371d4ca5cd444b12b93'
            '35cc1188c25f3b86f47512d2328dd519b68bf5cef97494f4c18de2d292096c59')

package() {	
  cd "$srcdir"

  mkdir -p "${pkgdir}"/usr/share/nextcloud-maintenance
  install -D -m755 nextcloud-backup.sh "$pkgdir/usr/share/nextcloud-maintenance/nextcloud-backup.sh" 
  
  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" nextcloud-backup.service
  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" nextcloud-backup.timer
}
