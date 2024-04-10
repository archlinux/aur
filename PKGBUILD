# Maintainer: Cross Nastasi <cross@dill.moe>
pkgname=yayclean
pkgver=1.0
pkgrel=1
pkgdesc="A script to clean orphaned packages using yay"
arch=('any')
url="https://github.com/dillfrescott/yayclean"
license=('GPL')
depends=('yay')
source=("yayclean.sh")
md5sums=('SKIP')

# The script content
_yayclean_script="#!/bin/bash

yay -Sc --noconfirm

yay -Rns \$(yay -Qdtq)
"

package() {
  # Write the script content to the destination
  echo "$_yayclean_script" > "${pkgdir}/usr/bin/yayclean"
  
  # Set the script permissions
  chmod +x "${pkgdir}/usr/bin/yayclean"
}
