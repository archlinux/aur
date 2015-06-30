# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Kevin Klement (klement at philos dot umass dot edu)
pkgname=otf-texgyre
pkgver=2.005
pkgrel=2
pkgdesc="High quality open source opentype font collection resembling Helvetica, Times, Palatino, Courier, Gothic, Bookman, Schoolbook, and Chancery." 
arch=('any')
url="http://www.gust.org.pl/projects/e-foundry/tex-gyre"
license=('custom:GUST Font License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("http://www.gust.org.pl/projects/e-foundry/tex-gyre/whole/tg-${pkgver}otf.zip")
install=$pkgname.install
md5sums=('3774af603b5a13d374bf4668967bff57')

package () {
  cd $srcdir

  install -d "$pkgdir"/usr/share{/fonts/OTF,/licenses/$pkgname}

  for files in $(find . -mindepth 1 -name '*.otf')
  do

      install -m 644 -t "$pkgdir"/usr/share/fonts/OTF "$files"

  done
  
  cat >> $pkgdir/usr/share/licenses/$pkgname/GUST-FONT-LICENSE.txt << EOF
% This is version 1.0, dated 22 June 2009, of the GUST Font License.
% (GUST is the Polish TeX Users Group, http://www.gust.org.pl)
%
% For the most recent version of this license see
% http://www.gust.org.pl/fonts/licenses/GUST-FONT-LICENSE.txt
% or
% http://tug.org/fonts/licenses/GUST-FONT-LICENSE.txt
%
% This work may be distributed and/or modified under the conditions
% of the LaTeX Project Public License, either version 1.3c of this
% license or (at your option) any later version.
% 
% Please also observe the following clause:
% 1) it is requested, but not legally required, that derived works be
%    distributed only after changing the names of the fonts comprising this
%    work and given in an accompanying "manifest", and that the
%    files comprising the Work, as listed in the manifest, also be given
%    new names. Any exceptions to this request are also given in the
%    manifest.
%    
%    We recommend the manifest be given in a separate file named
%    MANIFEST-<fontid>.txt, where <fontid> is some unique identification
%    of the font family. If a separate "readme" file accompanies the Work, 
%    we recommend a name of the form README-<fontid>.txt.
%
% The latest version of the LaTeX Project Public License is in
% http://www.latex-project.org/lppl.txt and version 1.3c or later
% is part of all distributions of LaTeX version 2006/05/20 or later.
EOF

    chmod 644 "$pkgdir"/usr/share/licenses/$pkgname/GUST-FONT-LICENSE.txt
}

