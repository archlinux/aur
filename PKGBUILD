# Maintainer: Daniel E. Shub <Daniel.Shub@nottingham.ac.uk>

## This PKGBUILD creates an Arch Linux package for the proprietary MATLAB application. A license from The MathWorks is needed in order to both build the package and to run MATLAB once the package is installed. In order to build the package the user must supply a licensed copy of the software and a file installation key. The file installation key must be saved in a plain text file with a name in the format of matlab-[RELEASE].lic (e.g., to install r2014a the file would be called matlab-r2014a.lic). The PKGBUILD requires that the MATLAB software be saved as an iso file with a name in the format of matlab-[RELEASE].iso (e.g., to install r2014a the file would be called matlab-r2014a.iso). If The MathWorks provided an iso file, this should be directly usable after it is appropriately renamed. For DVDs, the DVD must be first ripped to an appropriately named iso file. For versions of MATLAB up to r2013b, individual zip files of all toolboxes could be directly downloaded from a web interface at www.mathworks.com. Starting with r2014a only the main MATLAB installer can be downloaded. The remaining toolboxes must then be downloaded with the interactive installer (installation can be made to a temporary directory and canceled once the toolboxes are downloaded). Once all the toolboxes are downloaded they can be added to an iso file. The contents of the iso file depends on the release.

## For MATLAB releases including and after r2011b the contents of the iso file must include: ./archives/ ./bin/ ./etc/ ./help/ ./java/ ./sys/ ./activate.ini ./install ./installer_input.txt

## For MATLAB releases between r2010b and r2011a and the contents of the iso file must include: ./archives/ ./bin/ ./etc/ ./help/ ./java/ ./activate.ini ./install ./installer_input.txt

## The PKGBUILD does not support MATLAB releases including and prior to r2010a since the installer does not support unattended installation. In order for the PKGBUILD to create a package, all the toolboxes must be downloaded similar to releases r2010b-r2013b and then the installer must be run in interactive mode to create a local temporary installation of MATLAB. The installer can install MATLAB into an arbitrary directory (e.g., /tmp). This local temporary directory must then be added to an iso file and this could then be used in the PKGBUILD, but this is a lot of work to back port really old versions.

## It is not possible to separately package the toolboxes due to the DRM policies imposed by The MathWorks on MATLAB which requires that the installer be used to properly add and remove toolboxes. The toolboxes that can be added to the package are limited by the file installation key. In cases in which the file installation key allows for toolboxes to be included in the package that the license does not include, those packages will be installed, but unavailable to the user.





## ## Begin PKGBUILD ## ##

## While the most current MATLAB release is r2014b, it is possible to build the package with earlier releases.
_release=r2014b
#_release=r2014a
#_release=r2013b
#_release=r2013a
#_release=r2012b
#_release=r2012a
#_release=r2011b
#_release=r2011a
#_release=r2010b-sp2
#_release=r2010b-sp1
#_release=r2010b

## The default behavior is to build a single package matlab. By setting _multirelease to be true different packages can be created for each MATLAB release (e.g., matlab-r2010b, matlab-r2010b-sp1, ... , matlab-r2014a).
#_multirelease=true

## The default installation behavior is to install all licensed products whether or not they have been downloaded. To install only a subset of licensed products set _partialinstall to be true and remove unwanted entries from the _products array.
#_partialinstall=true
_products=("Aerospace_Blockset"
           "Aerospace_Toolbox"
           "Bioinformatics_Toolbox"
           "Control_System_Toolbox"
           "Communications_Blockset" # Removed in r2011a
           "Communications_System_Toolbox" # Added in r2011a
           "Communications_Toolbox" # Removed in r2011a
           "Computer_Vision_System_Toolbox" # Added in r2011a
           "Curve_Fitting_Toolbox"
           "DO_Qualification_Kit"
           "Data_Acquisition_Toolbox"
           "Database_Toolbox"
           "Datafeed_Toolbox"
           "DSP_System_Toolbox" # Added in r2011a
           "Econometrics_Toolbox"
           "EDA_Simulator_Link" # Removed in r2012a
           "Embedded_Coder" # Added in r2011a
           "Embedded_IDE_Link" # Removed in r2011a
           "Filter_Design_HDL_Coder"
           "Filter_Design_Toolbox" # Removed in r2011a
           "Financial_Derivatives_Toolbox" # Removed in r2012b
           "Financial_Instruments_Toolbox" # Added in r2012b
           "Financial_Toolbox"
           "Fixed_Income_Toolbox" # Removed in r2012b
           "Fixed_Point_Designer" # Added in r2013a
           "Fixed_Point_Toolbox" # Removed in r2013a
           "Fuzzy_Logic_Toolbox"
           "Gauges_Blockset"
           "Global_Optimization_Toolbox"
           "HDL_Coder" # Added in r2012a
           "HDL_Verifier" # Added in r2012a
           "IEC_Certification_Kit"
           "Image_Acquisition_Toolbox"
           "Image_Processing_Toolbox"
           "Instrument_Control_Toolbox"
           "LTE_System_Toolbox" # Added in r2014a
           "MATLAB"
           "MATLAB_Builder_EX"
           "MATLAB_Builder_JA"
           "MATLAB_Builder_NE"
           "MATLAB_Coder" # Added in r2011a
           "MATLAB_Compiler"
           "MATLAB_Distributed_Computing_Server"
           "MATLAB_Production_Server" # Added in r2012b
           "MATLAB_Report_Generator"
           "Mapping_Toolbox"
           "Model_Predictive_Control_Toolbox"
           "Model_Based_Calibration_Toolbox"
           "Neural_Network_Toolbox"
           "OPC_Toolbox"
           "Optimization_Toolbox"
           "Parallel_Computing_Toolbox"
           "Partial_Differential_Equation_Toolbox"
           "Phased_Array_System_Toolbox" # Added in r2011a
           "Polyspace_Bug_Finder" # Added in r2013b
           "Polyspace_Code_Prover" # Added in r2013b
           "RF_Toolbox"
           "Real_Time_Windows_Target"
           "Real_Time_Workshop" # Removed in r2011a
           "Real_Time_Workshop_Embedded_Coder" # Removed in r2011a
           "Robust_Control_Toolbox"
           "Signal_Processing_Blockset" # Removed in r2011a
           "Signal_Processing_Toolbox"
           "SimBiology"
           "SimDriveline"
           "SimElectronics"
           "SimEvents"
           "SimHydraulics"
           "SimMechanics"
           "SimPowerSystems"
           "SimRF"
           "Simscape"
           "Simulink"
           "Simulink_3D_Animation"
           "Simulink_Code_Inspector" # Added in r2011b
           "Simulink_Coder" # Added in r2011a
           "Simulink_Control_Design"
           "Simulink_Design_Optimization"
           "Simulink_Design_Verifier"
           "Simulink_Fixed_Point" # Removed in r2013a
           "Simulink_HDL_Coder" # Removed in r2012a
           "Simulink_PLC_Coder"
           "Simulink_Real_Time" # Added in r2014a
           "Simulink_Report_Generator"
           "Simulink_Verification_and_Validation"
           "Spreadsheet_Link_EX"
           "Stateflow"
           "Stateflow_Coder" # Removed in r2011a
           "Statistics_Toolbox"
           "Symbolic_Math_Toolbox"
           "System_Identification_Toolbox"
           "SystemTest"
           "Target_Support_Package" # Removed in r2011a
           "Trading_Toolbox" # Added in r2013a
           "Vehicle_Network_Toolbox"
           "Video_and_Image_Processing_Blockset" # Removed in r2011a
           "Wavelet_Toolbox"
           "xPC_Target" # Removed in r2014a
           "xPC_Target_Embedded_Option" # Removed in r2014a
)

_basename=matlab
pkgname="${_basename}"
pkgrel=1
pkgdesc="A high-level language for numerical computation and visualization"
arch=("x86_64")
url="http://www.mathworks.com"
license=(custom)
makedepends=("gendesk")
depends=("libxt"
         "libxpm"
         "libxmu"
         "libxp"
         "libxtst")
optdepends=("alsa-lib: For sound"
            "glu: For hardware accelerated OpenGL"
            "xorg-fonts-100dpi: For adjustable font sizes in figures on a local xserver"
            "gcc-libs: For MEX support")
source=("http://127.0.0.1/${_basename}-${_release}.iso"
        "http://127.0.0.1/${_basename}-${_release}.fik")
md5sums=('SKIP' 'SKIP')

## Add release dependent dependencies
case "${_release}" in
  r2014a) depends+=("libxrender");;
  r2014b) depends+=("libxrender" "libxxf86vm" "libxrandr");;
esac

## Convert release to version number
case "${_release}" in
  r2010b) pkgver=07.11.00;;
  r2010b-sp1) pkgver=07.11.01;;
  r2010b-sp2) pkgver=07.11.02;;
  r2011a) pkgver=07.12.00;;
  r2011b) pkgver=07.13.00;;
  r2012a) pkgver=07.14.00;;
  r2012b) pkgver=08.00.00;;
  r2013a) pkgver=08.01.00;;
  r2013b) pkgver=08.02.00;;
  r2014a) pkgver=08.03.00;;
  r2014b) pkgver=08.04.00;;
  *)
    echo "Unknown MATLAB release: ${_release}"
    exit 1
  ;;
esac

## Handle differences in the installation directories and package names associated with building a multi-release based package
if [ "${_multirelease}" = true ]; then
  pkgname+="-${_release}"
  _matlabdir="opt/${_basename}/${_release}"
  _licensedir="usr/local/${_basename}/${_release}/licenses"
  echo "Building a multi-release package (${pkgname})."
else
  _matlabdir="opt/${_basename}"
  _licensedir="usr/local/${_basename}/licenses"
  echo "Building a single release package (${pkgname})."
fi

## Determine the gcc version for the release
case "${_release}" in
  r2010b|r2010b-sp1|r2010b-sp2|r2011a|r2011b) _gccver=4.3;;
  r2012a|r2012b|r2013a) _gccver=4.4;;
  r2013b|r2014a|r2014b) _gccver=4.7;;
  *)
    echo "Unknown MATLAB release: ${_release}"
    exit 1
  ;;
esac
optdepends+=("gcc${_gccver//./}: For MEX support")

## Determine the gfortran version for the release
case "${_release}" in
  r2010b|r2010b-sp1|r2010b-sp2) _gfortranver='';;
  r2011a|r2011b|r2012a|r2012b|r2013a) _gfortranver=4.3;;
  r2013b|r2014a|r2014b) _gfortranver=4.7;;
  *)
    echo "Unknown MATLAB release: ${_release}"
    exit 1
  ;;
esac
optdepends+=("gcc-fortran${_gfortranver//./}: For MEX support")

## The icon file for the desktop launcher
case "${_release}" in
  r2010b|r2010b-sp1|r2010b-sp2|r2011a|r2011b|r2012a|r2012b|r2013a|r2013b) _icon=X11/icons/matlab64c_icon.xpm;;
  r2014a|r2014b) _icon=help/matlab/matlab_env/matlab_desktop_icon.png;;
  *)
    echo "Unknown MATLAB release: ${_release}"
    exit 1
  ;;
esac
_iconfilename=$(basename "${_icon}")
_iconextension="${_iconfilename##*.}"

prepare() {
  gendesk -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}"
  sed -i "/^Exec=/ s,$, -desktop," "${srcdir}/${pkgname}.desktop"

  sed -i "s,^# destinationFolder=,destinationFolder=${pkgdir}/${_matlabdir}," "${srcdir}/installer_input.txt"
  sed -i "s,^# fileInstallationKey=,fileInstallationKey=$(more ${_basename}-${_release}.fik)," "${srcdir}/installer_input.txt"
  sed -i "s,^# agreeToLicense=,agreeToLicense=yes," "${srcdir}/installer_input.txt"
  sed -i "s,^# mode=,mode=silent," "${srcdir}/installer_input.txt"

  if [ "${_partialinstall}" = true ]; then
    echo "Building a package with a subset of the licensed products."
    for _product in "${_products[@]}"; do
      sed -i "/^#product.${_product}$/ s/^#//" "${srcdir}/installer_input.txt"
      echo "The ${_product} product will be included in the package."
    done
  fi
}

package() {
  ## The MATLAB installer can get confused if it cannot connect to an X display, even if it is running in silent mode
  unset DISPLAY

  "${srcdir}/install" -t -inputFile "${srcdir}/installer_input.txt" -mode silent

  install -D -m644 "${pkgdir}/${_matlabdir}/license.txt" "${pkgdir}/usr/share/licenses/${_basename}/${_release}/LICENSE"

  ln -s "/${_licensedir}" "${pkgdir}/${_matlabdir}/licenses"

  install -d 755 "${pkgdir}/usr/bin/"
  ln -s "/${_matlabdir}/bin/matlab" "${pkgdir}/usr/bin/${pkgname}"


  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/${_matlabdir}/${_icon}" "${pkgdir}/usr/share/pixmaps/${pkgname}.${_iconextension}"

  sed -i "s#CC='gcc'#CC='gcc-${_gccver}'#g" "${pkgdir}/${_matlabdir}/bin/mexopts.sh"
  sed -i "s#CXX='g++'#CXX='g++-${_gccver}'#g" "${pkgdir}/${_matlabdir}/bin/mexopts.sh"
  sed -i "s#FC='gfortran'#FC='gfortran-${_gfortranver}'#g" "${pkgdir}/${_matlabdir}/bin/mexopts.sh"

  ## See $MATLABROOT/sys/os/glnxa64/README.libstdc++
  rm ${pkgdir}/${_matlabdir}/sys/os/glnxa64/{libstdc++.so.6,libgcc_s.so.1,libgfortran.so.3.0.0}
}
