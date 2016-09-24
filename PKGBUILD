
# Maintainer: Nathan Lowe <techwiz96@gmail.com>
# Upstream URL: https://github.com/kevinlekiller/cvt_modeline_calculator_12
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/nlowe/aur-cvt12

pkgname=cvt12-git
pkgver=1.2
pkgrel=1
pkgdesc='Generate mode timings using the CVT v1.2 or CVT v1.1 Timing Standards'
arch=('i686' 'x86_64')
url='https://github.com/kevinlekiller/cvt_modeline_calculator_12'
license=('custom')
makedepends=('gcc>=4.8.0', 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd $srcdir/cvt_modeline_calculator_12
  gcc cvt12.c -O2 -o cvt12 -lm -Wall
}

package() {
  install -Dm755 "$srcdir/cvt_modeline_calculator_12/cvt12" "$pkgdir/usr/bin/cvt12"

  mkdir -p $pkgdir/usr/share/licenses/cvt12
  cat <<'EOF' >> $pkgdir/usr/share/licenses/cvt12/LICENSE
Copyright (c) 2001, Andy Ritger  aritger@nvidia.com
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

o Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.
o Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer
  in the documentation and/or other materials provided with the
  distribution.
o Neither the name of NVIDIA nor the names of its contributors
  may be used to endorse or promote products derived from this
  software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

This program is based on the Generalized Timing Formula(GTF TM)
Standard Version: 1.0, Revision: 1.0

The GTF Document contains the following Copyright information:

Copyright (c) 1994, 1995, 1996 - Video Electronics Standards
Association. Duplication of this document within VESA member
companies for review purposes is permitted. All other rights
reserved.

While every precaution has been taken in the preparation
of this standard, the Video Electronics Standards Association and
its contributors assume no responsibility for errors or omissions,
and make no warranties, expressed or implied, of functionality
of suitability for any purpose. The sample code contained within
this standard may be used without restriction.
EOF
}
