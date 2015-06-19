# Maintainer: Konstantin Stepanov <me@kstep.me>
pkgname=systemd-crontab-generator
pkgver=0.8
pkgrel=1
pkgdesc="systemd generator to generate timers/services from crontab and anacrontab files"
url="https://github.com/kstep/systemd-crontab-generator"
arch=('any')
license=('GPL3')
depends=('python2' 'systemd')
provides=('cron' 'anacron')
replaces=('cron' 'anacron')
source=(systemd-crontab-generator
        systemd-crontab-update
        cron.target
        crontab
        systemd-crontab-generator.1
        crontab.1
        crontab.5)
md5sums=('3e6e2fb5bf3a6f05cacfbbb113516026'
         '6f00710ad710e319b52edef3e98bd010'
         '97450f27b69a1e88f1b21faad403df7c'
         '4ac2cfc8de6dabf2e08f39b3c3557879'
         '15acf6fd2a9533c13ce21c6e03210194'
         'd863925d682395cef72701725f180884'
         'f5e92c03bcb37acd580e2e27f5facc6a')

build() {
    echo
}

package() {
    install --mode=0755 -D systemd-crontab-generator ${pkgdir}/usr/lib/systemd/system-generators/systemd-crontab-generator
    install --mode=0644 -D systemd-crontab-generator.1 ${pkgdir}/usr/share/man/man1/systemd-crontab-generator.1
    gzip ${pkgdir}/usr/share/man/man1/systemd-crontab-generator.1
    install --mode=0755 -D systemd-crontab-update ${pkgdir}/usr/bin/systemd-crontab-update
    install --mode=0644 -D cron.target ${pkgdir}/usr/lib/systemd/system/cron.target
    install --mode=0755 -D crontab ${pkgdir}/usr/bin/crontab
    install --mode=0644 -D crontab.1 ${pkgdir}/usr/share/man/man1/crontab.1
    gzip ${pkgdir}/usr/share/man/man1/crontab.1
    install --mode=0644 -D crontab.5 ${pkgdir}/usr/share/man/man5/crontab.5
    gzip ${pkgdir}/usr/share/man/man5/crontab.5
}
