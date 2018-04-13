# Maintainer: LinRuoshui <lin.ruohshoei@gmail.com>
# Contributor: Rene Schoebel <schoebel.r at gmail dot com>
# Contributor: Ezekiel Sulastin <zekesulastin@gmail.com>

# This package relies on the filesystem layout provided by
#       fs2_open and fs2_open-data.

# This package is also really big - about 1.7 GB for the downloads
#       and over 5 GB uncompressed.  Make sure you have space;
#       the caveats about fs2_open-data apply here as well.

pkgname=fs2_open-mediavps
pkgver=2014
pkgrel=3
pkgdesc="Dramatic audiovisual enhancements for fs2_open"
arch=('any')
url="http://www.hard-light.net/forums/index.php?board=120.0"
license=('custom:fs2_open')
changelog=$pkgname.changelog
#depends=('fs2_open>1:3.7.1')
source=(https://porphyrion.feralhosting.com/datacorder/mvp_files/2014/MV_Root.7z 
	https://porphyrion.feralhosting.com/datacorder/mvp_files/2014/MV_Music.7z
 	https://porphyrion.feralhosting.com/datacorder/mvp_files/2014/MV_Assets.7z
	https://porphyrion.feralhosting.com/datacorder/mvp_files/2014/MV_Effects.7z
	https://porphyrion.feralhosting.com/datacorder/mvp_files/2014/MV_Advanced.7z
	https://porphyrion.feralhosting.com/datacorder/mvp_files/2014/MV_A-Glows.7z
	https://porphyrion.feralhosting.com/datacorder/mvp_files/2014/MV_RadarIcons.7z
	https://porphyrion.feralhosting.com/datacorder/mvp_files/2014/MV_CB_ANI_1.7z
	https://porphyrion.feralhosting.com/datacorder/mvp_files/2014/MV_CB_ANI_2.7z
	LICENSE
	fs2_open-mediavps
	fs2_open-mediavps.changelog
	fs2_open-mediavps.desktop)
sha256sums=('060502b07d60c0b559f021e66f51e8da73043a9d9828d535bff88a3c4f2ca36c'
            'db08f784e4331cf5a919a510a0858b996a13185ec6a11f7e63fa290433142565'
            '96a313701a0bbbc3acbd05f2bc526bbafce5ddf67f28864324c96a3717ac7361'
            '620c4feb9eb31a9e43069dae22b65d6538ca7960f25aa84fff516ebc641682b9'
            'bd4ea0306e2f39e436b404a8ad5eafb95b5f8a52bb3620c51bbbc06bb97eff98'
            '00915e17ab316357ff063bb29f6b87632cbf0174769b2a239e73ee48c89fc3dc'
            'cd1949034ca9f79db4ede3d995653d9dbc63c8a47ff905a987f9ab34ccb99432'
            '9b5140b66275ceabb66f6dbd86893bd09178b1eddeff64fca68b16578fc1a635'
            'd2cf71b0461f1792427aa3ece6cc337f5950892c8eff200d6b4a57cfa2d42203'
            '15ae775714f0cdd5c53c808eb732c7de7b3b78fe13a8cf11e67bb6c39be42cc5'
            '01e2f2088a377e03886670e13212c605348aded69e55a340867bc241caf87944'
            '0ec3486ca2aeb137135f34881565b551130f830070271a809f06e655a1aa28dd'
            '7c6bff367cb219105111f03509f6cdd2ac1fb823e205acdc0ebe8576d2a09c52')
PKGEXT=".pkg.tar"

package() {
  cd "$srcdir"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 fs2_open-mediavps.desktop "$pkgdir/usr/share/applications/fs2_open-mediavps.desktop"
  install -D -m755 fs2_open-mediavps "$pkgdir/usr/bin/fs2_open-mediavps"
  install -d -m755 "$pkgdir/opt/fs2_open"

  mv MediaVPs_2014 "$pkgdir/opt/fs2_open/mediavps_2014"
}
