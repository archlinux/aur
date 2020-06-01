pkgname=fake-hwclock
pkgver=0.3
pkgrel=1
pkgdesc="Saves time on shutdown and restores it on boot from a file"
arch=('any')
license=('GPL')
install=fake-hwclock.install
source=('fake-hwclock.sh'
        'fake-hwclock.service'
        'fake-hwclock-save.service'
        'fake-hwclock-save.timer')
md5sums=('ebba7a7f7e4018dc756aab29877bec39'
         'fa52aac3db246575c3cc8c1bf608766c'
         '9f93ed2b74260d204a9c285d35ee2daa'
         'b2b494cb4ba99eb12df3cb4188902ca4')

package() {
  install -D -m755 "${srcdir}/fake-hwclock.sh" "${pkgdir}/usr/lib/systemd/scripts/fake-hwclock.sh"
  for unit in \
    fake-hwclock.service \
    fake-hwclock-save.service \
    fake-hwclock-save.timer
  do
    install -D -m644 "${srcdir}/$unit" "${pkgdir}/usr/lib/systemd/system/$unit"
  done
}
