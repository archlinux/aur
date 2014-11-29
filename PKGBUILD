# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=mutt-utils
pkgver=1
pkgrel=4
pkgdesc="A bunch of scripts and config files to coordinate mutt with external apps"
arch=('i686' 'x86_64')
url="http://spocom.com/users/gjohnson/mutt/"
license=('GPL')
depends=('libx11')
optdepends=('xlhtml: Excel (xlhtml) and Powerpoint (ppthtml) to html converter'
            'wv: to load and parse Word 2000, 97, 95 and 6 file formats')
source=(http://www.spocom.com/users/gjohnson/mutt/excel2text
        http://www.spocom.com/users/gjohnson/mutt/mailcap
        http://www.spocom.com/users/gjohnson/mutt/mail-to-filter
        http://www.spocom.com/users/gjohnson/mutt/mutt_bgrun
        http://www.spocom.com/users/gjohnson/mutt/mutt_expires_editor
        http://www.spocom.com/users/gjohnson/mutt/mutt_netscape
        http://www.spocom.com/users/gjohnson/mutt/mutt_octet_view
        http://www.spocom.com/users/gjohnson/mutt/ppt2text
        http://www.spocom.com/users/gjohnson/mutt/word2text
        http://www.fiction.net/blong/programs/mutt/autoview/RunningX.c)
md5sums=('afb12cef3b38ccee6f354b6a4a1090f2'
         '1380d5b3958d0fc5504ec068fcc900e1'
         'b076d50c353fbb4da78522e190c4d798'
         'fc31578879fe0527335311f01b2d4fba'
         'd8786450669e8b45eef09d58ff766f54'
         'fff09a07cbf5ae30bee2d09837d19096'
         '5f6aa89757e2326e2ecb2f779bf708f1'
         'dcde1a7757fdc51316398900b6be182f'
         '49300fe71db49158bed89c14e611040c'
         '31fa80ae98c0fefe11e4786b2d7e4e79')

build() {
  cd "${srcdir}"

  gcc -o RunningX RunningX.c -lX11
}

package() {
  cd "${srcdir}"

  install -D -m755 "${srcdir}"/excel2text "${pkgdir}"/usr/bin/excel2text
  install -D -m755 "${srcdir}"/mail-to-filter "${pkgdir}"/usr/bin/mail-to-filter
  install -D -m755 "${srcdir}"/mutt_bgrun "${pkgdir}"/usr/bin/mutt_bgrun
  install -D -m755 "${srcdir}"/mutt_expires_editor "${pkgdir}"/usr/bin/mutt_expires_editor
  install -D -m755 "${srcdir}"/mutt_netscape "${pkgdir}"/usr/bin/mutt_netscape
  install -D -m755 "${srcdir}"/mutt_octet_view "${pkgdir}"/usr/bin/mutt_octet_view
  install -D -m755 "${srcdir}"/ppt2text "${pkgdir}"/usr/bin/ppt2text
  install -D -m755 "${srcdir}"/word2text "${pkgdir}"/usr/bin/word2text
  install -D -m755 "${srcdir}"/RunningX "${pkgdir}"/usr/bin/RunningX
  install -D -m644 "${srcdir}"/mailcap "${pkgdir}"/etc/mailcap.muttutilssample
}
