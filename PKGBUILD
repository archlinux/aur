# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitlab-upgrade-hook
pkgver=1
pkgrel=4
pkgdesc='Automatically shut down, run db:migrate, then start services after upgrade'
arch=('any')
depends=('pacman-contrib' 'gitlab')
source=('gitlab-pre.hook'
        'gitlab-post.hook'
        'gitlab-post.sh')
sha256sums=('6996bb8e24142a050642dfe932907d1d4e6af74ecea392706d9407863458470e'
            'aa5f9a9f4af3b190e2ca52ffc567c3a35374877e5e8d39a34dcdb753cde22c7e'
            '0ccf4d187f56f8769001085263fee873438b450de9bbd626fb7d4208578ed8c5')

package() {
    local _libalpm="$pkgdir/usr/share/libalpm"
    install -Dm0644 -t "$_libalpm/hooks/" gitlab-{pre,post}.hook
    install -Dm0755 -t "$_libalpm/scripts/" gitlab-post.sh
}
