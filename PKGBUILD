# Maintainer: Diego <cdprincipe@at@gmail@dot@com>

pkgname=numix-utouch-icon-theme
_date=20130808
pkgver=0.4
pkgrel=4
pkgdesc="Touch style of Numix icon theme"
arch=('any')
url="https://launchpad.net/~numix-icon-theme-dev/+archive/utouch"
license=('GPL3')
source=("https://launchpad.net/~numix-icon-theme-dev/+archive/utouch/+files/numix-utouch-icon-theme_0.4-24%7Eppa%2B20130808%7Esaucy1.tar.gz")

package() {
  cd "$srcdir"/recipe-{debupstream}-{revno}~ppa+20130808/Numix-uTouch/

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Numix-uTouch

  # clean up
  rm -rf {.git,.gitignore,CREDITS,LICENSE,README}

  # install theme
  cp -r . "$pkgdir"/usr/share/icons/Numix-uTouch/

  # Fix permissions
  find "$pkgdir"/usr/share/icons/Numix-uTouch/ -type f -exec chmod 0644 '{}' \;
  find "$pkgdir"/usr/share/icons/Numix-uTouch/ -type d -exec chmod 0755 '{}' \; 
}


md5sums=('655f043a84f06468dcfac666b30fc64f')
