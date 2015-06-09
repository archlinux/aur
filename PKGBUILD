# Maintainer: Kevin Klement (klement at philos dot umass dot edu)
pkgname=otf-bergamo
pkgver=1
pkgrel=3    
pkgdesc="Open type serif font resembling Bembo"
arch=('any')
url="http://www.fontsite.com/download-free-fonts/bergamo-std"
license=('custom:FontSite Free Font License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=(http://www.fontsite.com/freefonts/BergamoStd.zip)
noextract=(BergamoStd.zip)
install=$pkgname.install
md5sums=('2e0ded1cf1791dc8650510087aaff2de')
build()
{
  cd $srcdir/
  unzip -j BergamoStd.zip
  chmod a+r *.otf
  chmod a-x *.otf
  mkdir -p $pkgdir/usr/share/fonts/OTF
  cp *.otf $pkgdir/usr/share/fonts/OTF
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
cat >> $pkgdir/usr/share/licenses/$pkgname/EULA.txt << EOF
End-User License Agreement [Free Fonts]

This typeface software (“SOFTWARE”) is the property of FontSite Inc. Its use by you is covered under the terms of an End-User License Agreement (“EULA”). By exercising your rights to make and use copies of this SOFTWARE, you agree to be bound by the terms of this EULA. If you do not agree to the terms of this EULA, you may not use the SOFTWARE.

The SOFTWARE may be utilized for production purposes as needed for final output on any surface where the image will be rendered at a fixed size (e.g., document, t-shirt, computer screen).

EMBEDDING:
Adobe Portable Document Format (“PDF”) Embedding: Users may embed the licensed fonts into any read-only PDF you send to third parties. Unless the SOFTWARE is distributed as outlined below such documents may only be viewable and printable (but not editable) by the recipients.

HTML Web Page Embedding: Users may embed the licensed fonts into HTML web pages only for the purpose of typesetting the page using any of the following methods and technologies: @font-face Cascading Style Sheet (“CSS”) rules, Adobe Flash files, Microsoft Silverlight files, sIFR, fLIR, Cufón and Typeface.js. Other technologies not listed here that would allow a designer to typeset web pages using the licensed fonts are allowed. The licensed fonts must not be obviously downloadable and must be reasonably hidden from average users with whatever web page embedding method employed.

Application and Game Embedding: Users may embed the licensed fonts into a computer application or game only with the written permission of FontSite Inc.

This SOFTWARE is a valuable asset of FontSite Inc. which is protected by copyright laws and international copyright treaties, as well as other intellectual property laws and treaties. The typeface software is licensed, not sold.

This EULA grants you the following rights:

    * You may install and use an unlimited number of copies of this SOFTWARE.
    * You may reproduce and distribute an unlimited number of copies of this SOFTWARE, provided that each copy shall be a true and complete copy, including all copyright and trademark notices, electronic documentation (user guide in PDF format, etc.), and shall be accompanied by a copy of this EULA. Copies of the SOFTWARE may not be distributed for profit either on a standalone basis or included as part of your own product.
EOF
}

