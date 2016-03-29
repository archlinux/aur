# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

################################################################################
#
# Important, read first!
#
# Link files from /usr/share/hunspell to /etc/mozilla-custom-dictionaries, e.g.
#
# ln -s /usr/share/hunspell/en_US.aff /etc/mozilla-custom-dictionaries/en_US.aff
# ln -s /usr/share/hunspell/en_US.dic /etc/mozilla-custom-dictionaries/en_US.dic
#
################################################################################

pkgname=mozilla-custom-dictionaries
pkgver=1
pkgrel=2
pkgdesc="Select which dictionaries should be available system-wide"
arch=('any')
license=('WTFPL')
depends=('bash')
optdepends=('firefox: Replace dictionaries for Firefox'
            'thunderbird: Replace dictionaries for Thunderbird')
source=("hook.install"
        "hook.remove"
        "hook.sh")
md5sums=('552f855995df81a58c91e9cc6fe23015'
         'c7cbdf2991483a95e7d5ad95fac77418'
         '4ccccd20097e188ca796c8a2db5a8ad8')

package() {
    install -D -m 644 hook.install "$pkgdir/usr/share/libalpm/hooks/70-mcd-install.hook"
    install -D -m 644 hook.remove "$pkgdir/usr/share/libalpm/hooks/70-mcd-remove.hook"
    install -D -m 755 hook.sh "$pkgdir/usr/lib/mozilla-custom-dictionaries/alpm-hook"
    install -d -m 755 "$pkgdir/etc/mozilla-custom-dictionaries"
}
