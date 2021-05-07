# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitlab-upgrade-hook
pkgver=1
pkgrel=1
pkgdesc='Automatically shut down, run db:migrate, then start services after upgrade'
arch=('any')
depends=('pacman-contrib')
source=('gitlab-pre.hook'
		'gitlab-post.hook'
		'gitlab-post.sh'
		)
sha256sums=('6996bb8e24142a050642dfe932907d1d4e6af74ecea392706d9407863458470e'
            'aa5f9a9f4af3b190e2ca52ffc567c3a35374877e5e8d39a34dcdb753cde22c7e'
            '00aba3b1cf8d58e400e4dff195b1eba0c1379331b1fec9c11fcb3b6b8b58a749')

package() {
  install -D -m0644 -t "$pkgdir/usr/share/libalpm/hooks/" gitlab-{pre,post}.hook
  install -D -m0755 -t "$pkgdir/usr/share/libalpm/scripts/" gitlab-post.sh
}
